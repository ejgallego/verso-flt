#!/usr/bin/env python3
"""Check the chapter and renamed-lemma links that previously failed generation."""

from __future__ import annotations

import argparse
from html.parser import HTMLParser
import json
from pathlib import Path
from urllib.parse import urljoin, urlsplit, unquote


CHAPTER_TAGS = (
    "ch_reductions",
    "ch_overview",
    "ch_freyreduction",
    "Haar_char_project",
    "Adele_miniproject",
    "Fujisaki_project",
    "Quat_alg_project",
)
COSET_LEMMA = "bijOn_unipotent_mul_diagU1_U1diagU1"
SITE_URL = "https://blueprint.invalid/"


class Page(HTMLParser):
    def __init__(self, url: str) -> None:
        super().__init__()
        self.base = url
        self.ids: set[str] = set()
        self.links: list[tuple[str, str]] = []
        self.in_paragraph = False
        self.link: tuple[str, list[str]] | None = None

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        attributes = dict(attrs)
        if identity := attributes.get("id"):
            self.ids.add(identity)
        if tag == "base" and (href := attributes.get("href")):
            self.base = urljoin(self.base, href)
        if tag == "p":
            self.in_paragraph = True
        if tag == "a" and self.in_paragraph and (href := attributes.get("href")):
            self.link = (urljoin(self.base, href), [])

    def handle_data(self, data: str) -> None:
        if self.link is not None:
            self.link[1].append(data)

    def handle_endtag(self, tag: str) -> None:
        if tag == "a" and self.link is not None:
            href, text = self.link
            self.links.append((href, "".join(text).strip()))
            self.link = None
        if tag == "p":
            self.in_paragraph = False


def check_site(site: Path) -> None:
    xrefs = json.loads((site / "xref.json").read_text())
    pages: dict[Path, Page] = {}
    for path in site.rglob("*.html"):
        page = Page(urljoin(SITE_URL, path.relative_to(site).as_posix()))
        page.feed(path.read_text())
        pages[path.resolve()] = page
    links = [link for page in pages.values() for link in page.links]

    targets = [
        (tag, xrefs["Verso.Genre.Manual.section"]["contents"].get(tag, []))
        for tag in CHAPTER_TAGS
    ]
    targets.append((COSET_LEMMA, xrefs["«Informal.Block.informal»"]["contents"].get(COSET_LEMMA, [])))
    for label, entries in targets:
        if len(entries) != 1:
            raise AssertionError(f"{label}: expected one canonical target, got {len(entries)}")
        entry = entries[0]
        target = urljoin(SITE_URL, entry["address"]) + "#" + entry["id"]
        address = urlsplit(target)
        path = site / unquote(address.path).lstrip("/")
        if path.is_dir():
            path /= "index.html"
        if path.resolve() not in pages or unquote(address.fragment) not in pages[path.resolve()].ids:
            raise AssertionError(f"{label}: target is missing from generated HTML: {target}")
        if not any(href == target and text for href, text in links):
            raise AssertionError(f"{label}: no nonempty prose link reaches its canonical target")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--site-dir", type=Path, default=Path("_out/site/html-multi"))
    args = parser.parse_args()
    check_site(args.site_dir)
    print("Chapter and renamed-lemma reference regression passed.")


if __name__ == "__main__":
    main()
