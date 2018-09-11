<!-- .slide: data-state="blank-slide" class="full-screen" id="firework" data-menu-title="git-explode" data-timing="40" -->
<img alt="Firework" src="images/firework1.jpg"/>


<!-- .slide: data-state="normal" id="git-explode-concept" data-menu-title="Concept" data-timing="40" -->
# `git-explode` concept

*   Explodes a linear sequence of git commits into
    new independent `topicN` branches
*   <!-- .element: class="fragment" -->
    Creates fresh git history where parent-child relationships
    mirror commit dependency tree: <br />
    if child *C* has parent *P*, *C* has textual dependency on *P*
*   <!-- .element: class="fragment" -->
    Simultaneous dependency of commit *X* on `topicA` and `topicB`
    is represented by making *X*'s parent a merge commit of
    `topicA` and `topicB`


<!-- .slide: data-state="normal" id="git-explode-use-cases" data-timing="40" data-menu-title="Use cases" -->
## `git-explode` use cases

### Clean up messy branches <!-- .element: class="fragment" -->

*   <!-- .element: class="fragment" -->
    Regroup commits by topic
*   <!-- .element: class="fragment" -->
    Keep refactorings / bug fixes / new features separate

### Publishing a previously private codebase <!-- .element: class="fragment" -->

*   <!-- .element: class="fragment" -->
    Similar to above, but on a larger scale

### Decompose changes for porting <!-- .element: class="fragment" -->

### Breaking down giant commits <!-- .element: class="fragment" -->

*   <!-- .element: class="fragment" -->
    e.g. split huge "fix all PEP8 warnings" commit into one commit per hunk
*   <!-- .element: class="fragment" -->
    regroup onto existing topic branches

### &lt;insert your ideas here&gt; <!-- .element: class="fragment" -->


<!-- .slide: data-state="normal" id="git-explode-implementation" data-timing="40" data-menu-title="Implementation" -->
# `git-explode` implementation details

*   <!-- .element: class="fragment" -->
    Python module with CLI
*   <!-- .element: class="fragment" -->
    Re-uses dependency detection library from `git-deps`
*   <!-- .element: class="fragment" -->
    https://github.com/aspiers/git-explode


<!-- .slide: data-state="section-break" id="explode-demo" data-menu-title="Demo" data-timing="120" -->
# `git-explode` demo
