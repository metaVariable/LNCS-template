# Latex CI Template (GitHub Actions)

## Features

- push commits to build `main.tex` (default: [`ipsj_v4`](https://www.ipsj.or.jp/journal/submit/style.html) format)
- push tags to release `main.pdf`


![release generated PDF](./image.png "release generated PDF")


## Usage

(Requirement: [GitHub Actions](https://github.com/features/actions))
1. Fork this repository
2. modify files as you wish (default: `ipsj_v4` format)
3. Push commits to automatically build `main.tex`, and push tags to release generated PDF (`main.pdf`)

## Configurations

- latex config ([.latexmkrc](.latexmkrc))
- GitHub Actions workflow ([.github/workflows/buildPDF.yml](.github/workflows/buildPDF.yml))

## References

- https://www.ipsj.or.jp/journal/submit/style.html (ipsj_v4)
- https://github.com/Paperist/docker-alpine-texlive-ja (docker image for latex build)
- https://github.com/s4ichi/latex-template (.latexmk)
- https://github.com/marketplace/actions/gh-release (GitHub Action for release PDF)
