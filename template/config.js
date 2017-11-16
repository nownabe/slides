Reveal.initialize({
  controls: true,
  progress: true,
  slideNumber: true,
  history: true,
  keyboard: true,
  overview: true,
  center: true,
  touch: true,
  embedded: window.location.search.match(/embedded/gi),

  // note / fade / slide / convex / concave / zoom
  transition: "fade",

  width: "90%",
  height: "100%",
  margin: 0,
  minScale: 1,
  maxScale: 1,

  math: {
    mathjax: "https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js",
    config: "TeX-AMS_HTML-full",
  },

  dependencies: [
    { src: "lib/js/classList.js", condition: () => !document.body.classList },
    { src: "plugin/markdown/marked.js", condition: () => !!document.querySelector("[data-markdown]") },
    { src: "plugin/markdown/markdown.js", condition: () => !!document.querySelector("[data-markdown]") },
    { src: "plugin/highlight/highlight.js", async: true, callback: () => hljs.initHighlightingOnLoad() },

    // Alt + Click
    { src: "plugin/zoom-js/zoom.js", async: true },

    // Speaker notes (Press S key)
    { src: "plugin/notes/notes.js", async: true },

    // MathJax
    { src: "plugin/math/math.js", async: true },
  ]
});
