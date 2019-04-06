<!-- .slide: data-state="blank-slide" class="full-screen" id="magnifying-glass" data-menu-title="git-deps" data-timing="20" -->
<img alt="Magnifying glass inspecting dependencies" src="images/dependency.jpg"/>

Note:

git-deps is a tool for inspecting dependencies between git commits.
But what do we mean by dependencies?


<!-- .slide: data-state="normal" id="git-deps-concept" data-timing="40" data-menu-title="Concept" -->
# `git-deps` concept

*   Automatically detects *textual* dependencies between commits
*   <!-- .element: class="fragment" -->
    "Which commits would I need in order to cherry-pick this one without conflicts?"

<pre class="fragment">
<code class="lang-diff hljs">
@@ -500,8 +495,7 @@ def _id_to_base64(id):
 
     def _is_volume_creation_safe(self,
                                  protection_domain,
-                                 storage_pool,
-                                 provision_type):
+                                 storage_pool):
         """Checks if volume creation is safe or not.
 
         Using volumes with zero padding disabled can lead to existing data
</code>
</pre>

Note:

- Only talking about textual dependencies.
- An AI simulation of the human brain is not yet implemented,
  so it can't detect all semantic dependencies.
- "If something's worth doing, it's worth doing badly."


<!-- .slide: data-state="normal" id="git-deps-algo" data-timing="40" data-menu-title="Algorithm" -->
# `git-deps` algorithm

*   `git diff` commit with its parent
*   <!-- .element: class="fragment" -->
    For each diff hunk, run `git blame` on parent

<pre class="fragment">
<code class="lang-diff hljs">
-------- ----- @@ -502,4 +497,3 @@ def _id_to_base64(id):
7feb6219   502                                   protection_domain,
7feb6219   503 -                                 storage_pool,
7feb6219   504 -                                 provision_type):
               +                                 storage_pool):
53d8f321   505          """Checks if volume creation is safe or not.
</code>
</pre>

*   <!-- .element: class="fragment" -->
    We see that `7feb6219` and `53d8f321` are dependencies
*   <!-- .element: class="fragment" -->
    Note that context *is* important

Note:

More lines of context will result in more dependencies.  It makes
sense to ensure that the number of lines chosen matches what's used
when cherry-picking etc.


<!-- .slide: data-state="normal" id="git-deps-motivation" data-timing="60" data-menu-title="Motivation" -->
## Why should we care about textual dependencies?

Chronological  <!-- .element: class="fragment" --> parent-child relationship tells us nothing about how the
*content* of commits relate to each other.

### Dependency analysis allows us to answer interesting questions, e.g.:
<!-- .element: class="fragment" -->

*   <!-- .element: class="fragment" -->
    Would swapping the order of parent *P* and child *C* via `rebase -i`
    cause merge conflicts?
*   <!-- .element: class="fragment" -->
    Would deleting parent *P* via `rebase -i` cause merge conflicts?
*   <!-- .element: class="fragment" -->
    Would transplanting child *C* to another branch (e.g. via
    [`git-transplant`](https://blog.adamspiers.org/2018/06/14/git-auto-magic/))
    <br /> cause merge conflicts?
*   <!-- .element: class="fragment" -->
    Whose code am I touching?
*   <!-- .element: class="fragment" -->
    How much effort might it take to port *C* to another branch?
*   <!-- .element: class="fragment" -->
    Can I automatically split a sequence of commits into independent
    subgroups?
*   <!-- .element: class="fragment" -->
    &lt;insert your ideas here&gt;


<!-- .slide: data-state="normal" id="git-deps-implementation" data-timing="40" data-menu-title="Implementation" -->
# `git-deps` implementation details

*   <!-- .element: class="fragment" -->
    Python module with CLI
*   <!-- .element: class="fragment" -->
    Optional web UI for visualising dependency tree (`flask`, `d3.js`)
*   <!-- .element: class="fragment" -->
    Depends on `pygit2` and `libgit2`
*   <!-- .element: class="fragment" -->
    https://github.com/aspiers/git-deps


<!-- .slide: data-state="normal" id="backport" data-timing="40" data-menu-title="Backporting" -->
# Real-world backporting challenge

### Backport a cinder enhancement from Rocky to Pike

*   <!-- .element: class="fragment" -->
    `VMware: Improve scalability of querying volumes`
*   <!-- .element: class="fragment" -->
    https://review.openstack.org/#/c/514504/

Note:

A full solution would require peer review, CI, and thorough testing!!


<!-- .slide: data-state="section-break" id="deps-demo" data-menu-title="Demo" data-timing="300" -->
# `git-deps` demo
