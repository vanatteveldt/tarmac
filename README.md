# Text Analysis in R for Media and Communication

An interactive Quarto book covering computational text analysis for media and communication researchers. Interactive code examples run directly in the browser via [quarto-live](https://r-wasm.github.io/quarto-live/) (WebAssembly — no server required).

## Prerequisites

| Tool | Minimum version | Install |
|---|---|---|
| R | 4.3 | [cran.r-project.org](https://cran.r-project.org/) |
| Quarto | 1.4 | [quarto.org](https://quarto.org/docs/get-started/) |
| renv | 1.0 | `install.packages("renv")` in R |

## Installation

### 1. Clone the repository

```sh
git clone https://github.com/your-org/your-repo.git
cd your-repo
```

### 2. Install the quarto-live extension

```sh
quarto add r-wasm/quarto-live
```

This downloads the extension into `_extensions/r-wasm/live/`. The `_extensions/` directory should be committed to version control so collaborators do not need to re-run this step.

### 3. Restore the R package environment

Open R in the project directory (or open the project in RStudio). renv activates automatically via `.Rprofile`:

```r
renv::restore()
```

This installs every package listed in `renv.lock` at the recorded versions into the project-local library (`renv/library/`). It does not affect your system-wide R packages.

> **First time on a machine?** If renv itself is not yet installed, run `install.packages("renv")` first, then `renv::restore()`.

## Rendering the book

### Preview locally (live reload)

```sh
quarto preview
```

Opens the book in your browser and rebuilds changed chapters automatically.

### Full render

```sh
quarto render
```

Output goes to `_book/`. Open `_book/index.html` in any browser.

### Render a single chapter

```sh
quarto render chapters/06-sentiment.qmd
```

### Freeze behaviour

`_quarto.yml` sets `execute: freeze: auto`. Quarto caches chunk output in `_freeze/` and only re-executes a chapter when its source changes. Commit `_freeze/` to version control so collaborators get pre-computed output without re-running all code.

## Package management with renv

This project uses [renv](https://rstudio.github.io/renv/) to ensure everyone uses identical package versions.

### Key commands

| Task | Command |
|---|---|
| Install packages from lockfile | `renv::restore()` |
| Record current installed versions | `renv::snapshot()` |
| Install a new package and record it | `install.packages("pkg")` then `renv::snapshot()` |
| Check for drift between library and lockfile | `renv::status()` |
| Update a package and re-lock | `renv::update("pkg")` then `renv::snapshot()` |

### Adding packages

1. Install the package normally: `install.packages("newpkg")`
2. Use it in a `.qmd` file
3. Run `renv::snapshot()` to update `renv.lock`
4. Commit the updated `renv.lock`

### Fresh setup (no existing lockfile)

If you are starting from scratch rather than restoring from a lockfile:

```r
renv::init()          # initialises renv in the project
source("packages.R")  # installs all project packages listed there
renv::snapshot()      # writes renv.lock with real hashes
```

### What is and is not committed

```
committed:
  renv.lock          # the source of truth for package versions
  renv/.gitignore    # tells git to ignore the library
  .Rprofile          # activates renv on project open

not committed (in .gitignore):
  renv/library/      # installed binaries — rebuilt per machine/OS
  renv/staging/
```

## Repository structure

```
.
├── _quarto.yml             # Book configuration and render settings
├── index.qmd               # Preface
├── chapters/
│   ├── 01-introduction.qmd
│   ├── 02-getting-started.qmd
│   ├── 03-data-collection.qmd
│   ├── 04-preprocessing.qmd
│   ├── 05-exploratory.qmd
│   ├── 06-sentiment.qmd
│   ├── 07-topic-modeling.qmd
│   ├── 08-content-analysis.qmd
│   ├── 09-word-embeddings.qmd
│   └── references.qmd
├── references.bib          # BibTeX bibliography
├── packages.R              # Package list for fresh renv setup
├── renv.lock               # Pinned package versions
├── renv/
│   └── .gitignore
├── .Rprofile               # Activates renv on startup
├── .gitignore
└── data/                   # Local data files (gitignored)
```

## Contributing

1. Create a branch, make changes, run `quarto render` to check output.
2. If you added or updated packages, commit the updated `renv.lock`.
3. If you added chapters, update the `chapters:` list in `_quarto.yml`.
4. Open a pull request.

## License

*Add license here.*
