# IAM Policy Library

Getting IAM Policies just right is a pain in the butt and the prebuilt AWS policies can be overly permissive for many use-cases. This is a collection of vetted policies for common real-world scenarios.

---

## 🤬 Hate IAM Policies and looking for something better?

You're not alone! We made [AppPack](https://apppack.io?utm_source=iam-policy-library) because working with AWS is challenging and you've got other things to worry about. AppPack makes deploying web apps to AWS dead simple and focuses on a great developer experience for your team.

👉 Check out it out at [apppack.io](https://apppack.io?utm_source=iam-policy-library) 👈

---

## Contributing
### Adding new policies

Prereqs:

* [`flosell/iam-policy-json-to-terraform`](https://github.com/flosell/iam-policy-json-to-terraform)
* `Node.js` (for running `prettier`)

1. Add the AWS Policy JSON to `library/{service}/`
3. Add a section to `src/{service}.md`
4. Run `make` to generate the Terraform equivalents and prettify the files


### Running locally

Prereqs:

* Python 3.11
* [`pdm`](https://pdm.fming.dev/)

```shell
pdm install
make serve
```

### Deployment

Hosted on GitHub Pages and handled via GitHub Actions. Push to `main` to deploy.
