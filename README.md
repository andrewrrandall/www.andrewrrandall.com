# www.andrewrrandall.com

Personal site + blog, hosted on GitHub Pages. On every push to `main`, the
`.github/workflows/pages.yml` Action builds the site with Jekyll, renders the resume PDF,
and deploys.

## Writing a new post

1. Start a draft:

   ```sh
   ./new-post.sh "My Post Title"
   ```

   This creates `_drafts/my-post-title.md`. Drafts are **not** published, so you can
   commit and push unfinished work safely.

2. Write the post in Markdown below the `---` header block. Optionally uncomment the
   `description:` line to control the link-preview text. Fenced code blocks
   (```` ```python ````) get syntax highlighting, and dbt/Jinja like `{{ ref('orders') }}`
   shows up exactly as written (template processing is turned off for posts).
3. When it's ready:

   ```sh
   ./publish-post.sh _drafts/my-post-title.md
   ```

   This moves it to `_posts/YYYY-MM-DD-my-post-title.md` with today's date. Commit and
   push: it goes live at `/blogs/my-post-title.html`, shows up on the home and
   [writing](https://andrewrrandall.com/blogs/writing.html) pages, and is added to the
   RSS feed and sitemap automatically.

Images: drop them in `photos/` and reference them with `![alt text](/photos/file.jpg)`.

## Updating the resume

Edit `_data/resume.yml` and push. `/resume.html` updates, and the GitHub Action
regenerates the downloadable PDF (`/andrew-randall-resume.pdf`) from the same data,
so the two never drift.

## Deploying

Push to `main`. The GitHub Action builds and deploys in about a minute; check the
**Actions** tab if something doesn't show up. (VS Code Live Server won't render the
site since it doesn't run Jekyll.)

## Layout

- `_posts/` – published posts (Markdown); `_drafts/` – unpublished drafts
- `_layouts/` – shared page templates (header/nav/footer, post page)
- `_includes/` – post list and social icons (SVGs from [Simple Icons](https://simpleicons.org))
- `_config.yml` – site title/description, social links, plugins
- `_data/resume.yml` – resume content
- `index.html` – home page; `blogs/writing.html` – list of all posts; `404.html`
- `style.css` – all site styling (body text is Source Serif 4, self-hosted in `fonts/`)
- `resume.html` – resume page template (content lives in `_data/resume.yml`)
