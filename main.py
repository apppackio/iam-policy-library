"""Jinja2 environment hook for custom macros"""
from pathlib import Path
from string import Template
from textwrap import indent

CODE_TMPL = Template(
    """
=== "AWS Policy"

    ```json
$json
    ```

=== "Terraform"

    ```terraform
$terraform
    ```
"""
)
LIBRARY = Path(__file__).parent / "library"


def define_env(env):
    "Hook function"

    @env.macro
    def library_code(service, slug):
        """The markdown formatted code snippets for a policy."""
        return CODE_TMPL.substitute(
            json=indent((LIBRARY / service / f"{slug}.json").read_text(), "    "),
            terraform=indent((LIBRARY / service / f"{slug}.tf").read_text(), "    "),
        )
