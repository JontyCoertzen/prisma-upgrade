const fs = require("fs")
const exec = require("execa")
const path = require("path")

const slugifyBase = require("slugify")

const slugify = (str) => {
  return slugifyBase(str).replace(/\./g, "-")
}

const root = path.join(__dirname, "..")
const prisma1 = path.join(root, "node_modules/.bin/prisma1")
const prisma2 = path.join(root, "node_modules/.bin/prisma")
const examples = path.join(root, "examples")
const dcConfigPath = path.join(root, "scripts/docker-compose-configs")
const cwd = __dirname

const mysqldump = require("mysqldump")

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms))
}

async function main() {
  const dcConfigDirs = await fs.readdirSync(dcConfigPath)
  try {
    for (dcConfigDir of dcConfigDirs) {
      const fullpath = path.join(dcConfigPath, dcConfigDir)
      const dcfile = path.join(fullpath, "docker-compose.yml")
      console.log(`starting docker compose ${dcConfigDir}`)
      await exec("docker-compose", ["-f", dcfile, "up", "-d"], { cwd })
      await sleep(20000)
    }

    const exampleDirs = await fs.readdirSync(examples)
    for (let example of exampleDirs) {
      if (example[0] === "_") {
        continue
      }
      const fullpath = path.join(examples, example)
      // TODO: comment out if you want to run anew
      if (fs.existsSync(path.join(fullpath, "dump.sql"))) {
        continue
      }
      console.log(`${example}: deploying Prisma 1 schema`)
      const prismayml = path.join(fullpath, "prisma.yml")
      let stdio
      try {
        stdio = await exec(prisma1, ["deploy", "-p", prismayml], { cwd })
      } catch (err) {
        if (!~err.stdout.indexOf("Your Prisma endpoint is live")) {
          throw err
        }
      }
      await sleep(20000)
      let dump = ""
      if (~example.indexOf(`mysql-`)) {
        console.log(`${example}: dumping MySQL schema`)
        const result = await mysqldump({
          connection: {
            host: "localhost",
            user: "root",
            password: "prisma",
            port: "3306",
            database: `${slugify(example)}@dev`,
          },
          dumpToFile: path.join(fullpath, "dump.sql"),
          data: false,
        })
        // dump = stdout
      } else {
        throw new Error("unknown database type")
      }
      // await fs.writeFileSync(path.join(fullpath, "dump.sql"), dump)
      const schemaPrisma = path.join(fullpath, "schema.prisma")
      fs.closeSync(fs.openSync(schemaPrisma, "w"))
      if (~example.indexOf(`mysql-`)) {
        console.log(`${example}: introspecting MySQL database`)
        await exec(
          prisma2,
          ["introspect", "--url", `mysql://root:prisma@0.0.0.0:3306/${slugify(example)}@dev`, `--schema`, schemaPrisma],
          {
            cwd,
          }
        )
      }
    }
  } catch (e) {
    console.log(e)
  } finally {
    for (dcConfigDir of dcConfigDirs) {
      const fullpath = path.join(dcConfigPath, dcConfigDir)
      const dcfile = path.join(fullpath, "docker-compose.yml")
      console.log(`shutting down docker compose ${dcConfigDir}`)
      await exec("docker-compose", ["-f", dcfile, "down"], { cwd })
    }
  }
}

main().catch(console.error)
