# Prisma Upgrade [![npm](https://img.shields.io/npm/v/prisma-upgrade)](https://www.npmjs.com/package/prisma-upgrade)

Prisma Upgrade is a CLI tool to help Prisma 1 users using MySQL or Postgres to upgrade to Prisma 2+.

## Scope

We spent a lot of time on this tool and are happy with the results. It's well-tested and working as intended. It's not perfect though, so you may need to make some manual adjustments after upgrading to clean up your final Prisma 2+ schema. See [this issue](https://github.com/prisma/upgrade/issues/67) for more details.

We recommend you download the [Prisma VS Code extension](https://marketplace.visualstudio.com/items?itemName=Prisma.prisma) to help with your transition.

Note: You should always run the SQL generated by this tool on your test or staging databases before running it on production.

## Usage

```sh
$ npx prisma-upgrade
```

See [our documentation](https://www.prisma.io/docs/guides/upgrade-from-prisma-1/how-to-upgrade#prisma-upgrade-cli) for more information about how to upgrade your Prisma 1 datamodel to Prisma 2+.

## Features

This table reflects the _current_ feature set of the upgrade CLI and will be updated continuously. Read below for a more detailed explanation of each column. 

| Problem                                                                                                                                                                                                                                                                               | MySQL   | PostgreSQL | Prisma schema | Prisma 1 compatible |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|------------|---------------|---------------------|
| _Database schema incompatibilities²_                                                                                                                                                                                                                                                  |         |            |               |                     |
| [Default values aren't represented in database](https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-mysql#default-values-arent-represented-in-database) <!-- SetDefaultOp -->                                                             | Yes     | Yes        | Yes           | Yes                 |
| [Mismatching CUID length](https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-mysql#mismatching-cuid-length) <!-- AlterIDsOp -->                                                                                                          | Yes     | Yes        | Yes           | Yes                 |
| [`@createdAt` isn't represented in database](https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-mysql#createdat-isnt-represented-in-database)<!-- SetCreatedAtOp -->                                                                     | Yes     | Yes        | Yes           | Yes                 |
| [Inline 1-1 relations are recognized as 1-n (missing `UNIQUE` constraint)](https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-mysql#inline-1-1-relations-are-recognized-as-1-n-missing-unique-constraint) <!-- AddUniqueConstraintOp --> | Yes     | Yes        | Yes           | Yes                 |
| [`Json` type is represented as `TEXT`](https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-mysql#json-type-is-represented-as-text-in-database) <!-- SetJsonTypeOp -->                                                                     | Yes     | Yes        | Yes           | Yes                 |
| [Enum types are represented as `TEXT` in database](https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-mysql#enums-are-represented-as-text-in-database) <!-- SetEnumTypeOp -->                                                            | Yes     | Yes        | Yes           | Yes                 |
| [All non-inline relations are recognized as m-n](https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-mysql#all-non-inline-relations-are-recognized-as-m-n) <!-- MigrateHasManyOp -->                                                      | Not yet | Not yet    | Not yet       | No                  |
| [Scalar lists (arrays) are maintained with extra table](https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-mysql#scalar-lists-arrays-are-maintained-with-extra-table) <!-- MigrateScalarListOp -->                                       | Not yet | Not yet    | Not yet       | No                  |
| _Prisma 2+ schema differences³_                                                                                                                                                                                                                                                       |         |            |               |                     |
| [`@updatedAt` isn't represented in database](https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-mysql#updatedat-isnt-represented-in-database) <!-- upgrade() -->                                                                         | n/a     | n/a        | Yes           | Yes                 |
| [Generated CUIDs as ID values aren't represented in database](https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-mysql#generated-cuids-as-id-values-arent-represented-in-database) <!-- upgrade() -->                                    | n/a     | n/a        | Yes           | Yes                 |
| Maintain required 1-1-relations                                                                                                                                                                                                                                                       | n/a     | n/a        | Yes           | Yes                 |
| Maintain order of models and fields                                                                                                                                                                                                                                                   | n/a     | n/a        | Not yet       | Yes                 |
| Maintain relation names                                                                                                                                                                                                                                                               | n/a     | n/a        | Not yet       | Yes                 |
| `@map` and `@@map`                                                                                                                                                                                                                                                                   | n/a     | n/a        | Yes           | Yes                 |
| Cascading deletes                                                                                                                                                                                                                                                                     | No      | No         | No            | No                  |
<!-- TODO: MigrateEnumListOp -->

² = fixed by executing SQL statements  
³ = fixed by making changes to Prisma 2+ schema

What do the columns mean?

- **MySQL**: Does the CLI generate the correct MySQL statements to solve the problem?
- **PostgreSQL**: Does the CLI generate correct PostgreSQL statements to solve the problem?
- **Prisma schema**: Does the final Prisma 2+ schema I get from the CLI reflect the right solution?
- **Prisma 1 compatible:** Does the SQL change to the schema maintain Prisma 1 compatibility?

## How Prisma Upgrade (Technically) Works

We parse your Prisma 1 datamodel and your Prisma 2+ schema and run both ASTs through a set of rules. These rules produce operations. The operations are printed into SQL commands for you to run on your database.

Prisma upgrade is idempotent, so you can run it as many times as you want and it will produce the same result each time. Prisma upgrade only shows you commands you still need to run, it does not show you commands you've already run.

You'll also notice that we never connect to your database, we simply look at your Prisma 1 files and your Prisma 2+ schema and generate from there!

## Development

To add a new test, follow the following steps:

1. Create a new folder with one of the following prefixes: `postgres-`, `mysql-`, `postgres1-` or `mysql1-`. Use `postgres-` and `mysql-` for Prisma `Prisma 1.34`, `postgres1` and `mysql1-` for versions before that.
2. Add a `prisma.yml` and `datamodel.graphql`
3. Run `node scripts/sqldump.js`. This should product a `dump.sql` file and a `schema.prisma`.
4. Add an `expected.sql`. This is the commands you expect to `prisma-upgrade` to guide you to do. Often, I first leave this blank, see what `prisma-upgrade` does and then tweak.
5. Add an `expected.prisma`. This is the final state the schema should be in. Often, I first leave this blank, see what `prisma-upgrade` does and then tweak.

## Tests

Testing during implementation of this tool consists of 2 parts: a Local SQL Dump and Running Tests

### Local SQL Dump

_Requirements:_ MySQL@5, Docker

Since it's cumbersome to run Prisma 1 in CI, we need to locally setup test cases first

### Setting up MySQL for examples

```
mysqladmin -h localhost -u root create prisma
mysql -h localhost -u root prisma < ./examples/mysql-ablog/dump.sql
mysqladmin -h localhost -u root drop prisma -f
```

## Security

If you have a security issue to report, please contact us at [security@prisma.io](mailto:security@prisma.io?subject=[GitHub]%20Prisma%202%20Security%20Report%20Upgrade)