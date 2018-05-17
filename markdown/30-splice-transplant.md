<!-- .slide: data-state="blank-slide" class="full-screen" id="splice" data-menu-title="git-splice" data-timing="40" -->
<img alt="Splicing video tape" src="images/splice.jpg"/>


<!-- .slide: data-state="normal" id="splice-info" data-menu-title="Details" data-timing="40" -->
# `git-splice`

*   Splices commits into/out of current branch
*   <!-- .element: class="fragment" -->
    Built as [a patch to `git`](https://github.com/git/git/compare/master...aspiers:splice)
*   <!-- .element: class="fragment" -->
    First announced [on the `git` mailing list in May
    2016](https://public-inbox.org/git/20160527140811.GB11256@pacific.linksys.moosehall/)
*   <!-- .element: class="fragment" -->
    Revitalised during subsequent [SUSE Hack Week](https://hackweek.suse.com/about)
*   <!-- .element: class="fragment" -->
    Further discussion [on the `git` mailing list in August
    2017](https://public-inbox.org/git/20170801011421.veyuviur3mi4hjir@pacific.linksys.moosehall/)


<!-- .slide: data-state="normal" id="transplant" data-menu-title="git-transplant" data-timing="40" -->
# `git-transplant`

*   Transplants commits from current branch to another
*   <!-- .element: class="fragment" -->
    Built as [a patch to `git`](https://github.com/aspiers/git/compare/splice...transplant)
*   <!-- .element: class="fragment" -->
    Built on top of `git-splice`
*   <!-- .element: class="fragment" -->
    Both tools [*reasonably* well received by
    Junio](https://public-inbox.org/git/20170801011421.veyuviur3mi4hjir@pacific.linksys.moosehall/) ;-)
*   <!-- .element: class="fragment" -->
    [Originally intended as a primitive for use in implementing
    `git-explode`](https://public-inbox.org/git/20170801011421.veyuviur3mi4hjir@pacific.linksys.moosehall/)
    *   That didn't work out, but useful in its own right
