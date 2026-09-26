# www.andrewrrandall.com

Personal site + blog, hosted on GitHub Pages (built with Jekyll automatically on push to `main`).

## Writing a new post

1. Create the post:

   ```sh
   ./new-post.sh "My Post Title"
   ```

   This creates `_posts/YYYY-MM-DD-my-post-title.md`.

2. Write the post in Markdown below the `---` header block. Optionally add a
   `description: "..."` line to the header to control the link-preview text.
3. Commit and push. The post shows up at `/blogs/my-post-title.html`, is listed
   on the home and [writing](https://andrewrrandall.com/blogs/writing.html) pages,
   and is added to the RSS feed (`/feed.xml`) and sitemap automatically.

Images: drop them in `photos/` and reference them with `![alt text](/photos/file.jpg)`.

## Previewing locally

VS Code Live Server won't work (it doesn't run Jekyll). Instead:

```sh
brew install ruby@3.3   # one time
./serve.sh
```

Then open http://localhost:4000. Pages rebuild and the browser reloads on save.

## Layout

- `_posts/` – blog posts (Markdown)
- `_layouts/` – shared page templates (header/nav/footer, post page)
- `_includes/` – post list and social icons (SVGs from [Simple Icons](https://simpleicons.org))
- `_config.yml` – site title/description, social links, plugins
- `index.html` – home page; `blogs/writing.html` – list of all posts; `404.html`
- `style.css` – all site styling
- `resume.html` – resume (standalone Google Docs export)
