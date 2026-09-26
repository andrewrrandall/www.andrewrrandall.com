# www.andrewrrandall.com

Personal site + blog, hosted on GitHub Pages (built with Jekyll automatically on push).

## Writing a new post

1. Create the post:

   ```sh
   ./new-post.sh "My Post Title"
   ```

   This creates `_posts/YYYY-MM-DD-my-post-title.md`.

2. Write the post in Markdown below the `---` header block.
3. Commit and push. The post shows up at `/blogs/my-post-title.html` and is
   listed automatically on the [writing](https://andrewrrandall.com/blogs/writing.html) page.

Images: drop them in `photos/` and reference them with `![alt text](/photos/file.jpg)`.

## Layout

- `_posts/` – blog posts (Markdown)
- `_layouts/` – shared page templates (header/nav/footer, post page)
- `blogs/writing.html` – list of all posts
- `blogs/blog_post.css` – blog styling
- `index.html`, `resume.html`, `style.css` – home page and resume
