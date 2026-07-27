<!-- WARNING: This file is managed automatically and may be overwritten at any time. -->

# Contributing

Thank you for considering contributing! This document outlines the standards and processes we follow to ensure consistent, high-quality contributions.

---

## 📐 Coding Guidelines

We follow the [Terraform language style conventions](https://developer.hashicorp.com/terraform/language/syntax/style). These ensure consistency across modules maintained by different teams.

Please:

- Format code using `terraform fmt`
- Use meaningful and consistent naming
- Write short, clear variable and output descriptions, as these will appear in module `README.md` files
- Prefer explicit types and variable defaults

---

## ✅ Opening a Pull Request

- **Commit style**: Use the [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/). We only support the following types for release automation:

  - `feat`: for new features
  - `fix`: for bug fixes
  - `chore`: for non-functional changes (e.g., CI, docs, refactoring)

> [!NOTE]
> To indicate a **breaking change**, append `!` to the type:
> Example: `feat!: remove deprecated module input`

- **Small PRs**: Smaller, focused pull requests are easier to review and merge. Aim to keep PRs limited in scope.

---

## 🌱 Branch Naming

Use short, descriptive branch names using hyphens:

- `fix-bug-name`
- `feat-new-feature`
- `chore-update-docs`

Include the issue number if applicable:
`feat-123-add-s3-encryption`

---

## 🚀 Release Process

This repository uses [release-please](https://github.com/googleapis/release-please) to automate releases.

### How It Works

1. When a pull request is merged into the default branch:

   - release-please **does not immediately publish a release**.
   - Instead, it creates or updates a **release PR** with:
     - A changelog entry (based on commit messages)
     - A proposed version bump (based on the type of commit)

2. The release PR is kept up to date as more feature or bug fix PRs are merged.

3. When the release PR is **merged**, a GitHub release is published automatically.

> [!NOTE]
> Only `feat` and `fix` commits affect the release.
> Commits with `!` trigger a **major version** bump, such as `feat!` or `fix!`.

### Excluding a PR from Release Notes

If your change should not appear in the changelog (e.g., formatting, refactoring), use `chore` as the conventional commit type.

---

## 📘 Module Documentation

Each Terraform module must include a `README.md` file that:

- Clearly describes the **purpose and scope** of the module
- Explains any assumptions, constraints, or dependencies
- Optionally includes links to examples under the `examples/` directory

Usage instructions (including inputs and outputs) are automatically generated using [terraform-docs](https://terraform-docs.io/).

Do not manually edit those sections—run terraform-docs as part of the pre-commit hook or CI pipeline to keep them consistent.

This helps ensure module consumers can quickly understand what the module does and how to use it.

---

## 🧪 Testing Guidelines

We encourage writing tests for all modules and logic using:

- `terraform validate` to ensure config correctness
- `tflint` to enforce style and linting
- (Optional) [writing terraform test](https://developer.hashicorp.com/terraform/tutorials/configuration-language/test)

Test your examples whenever possible to ensure modules can be applied successfully with default inputs.

---

## 🧾 Examples

Each module should include usage examples in the `examples/` directory:

- Include a `examples/basic` example showing the most common or minimal use case.
- Additional examples should go in topic-specific directories:
  - `examples/with_logging`
  - `examples/multi_region`
  - `examples/for_each_usage`

These examples serve as both validation and guidance for future users.

Keep examples up to date as module interfaces change.

---

## 🧰 Local Development

This repo uses [pre-commit](https://pre-commit.com/) to automatically check your code before committing. It helps catch common issues early.

### Setup

1. Install required tools:
   `brew install tflint`
   `pip3 install pre-commit --upgrade`
   or using Conda:
   `conda install -c conda-forge pre-commit`

2. Run checks against all files:
   `pre-commit run -a`

3. (Optional) Install hooks to run automatically before each commit:
   `pre-commit install`

---

## 🙌 Thank You

Whether you're fixing a typo, refactoring code, or proposing a feature -- your contribution is appreciated. If you have questions, feel free to open an issue.
