module.exports = function(eleventyConfig) {
  // Copy static assets to output
  eleventyConfig.addPassthroughCopy("public");
  eleventyConfig.addPassthroughCopy("_redirects");
  eleventyConfig.addPassthroughCopy("_headers");
  eleventyConfig.addPassthroughCopy("src/robots.txt");
  eleventyConfig.addPassthroughCopy("src/llms.txt");
  
  // Watch CSS for changes during development
  eleventyConfig.addWatchTarget("public/css/");
  
  // Add collection for blog posts
  eleventyConfig.addCollection("posts", function(collectionApi) {
    return collectionApi.getFilteredByGlob("src/blog/posts/*.md").sort((a, b) => {
      return b.date - a.date; // Sort by date descending (newest first)
    });
  });
  
  // Format date filter
  eleventyConfig.addFilter("readableDate", dateObj => {
    return new Date(dateObj).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  });
  
  // Limit filter for arrays
  eleventyConfig.addFilter("limit", (array, limit) => {
    return array.slice(0, limit);
  });
  
  return {
    dir: {
      input: "src",
      output: "_site",
      includes: "_includes",
      data: "_data"
    },
    templateFormats: ["md", "njk", "html"],
    markdownTemplateEngine: "njk",
    htmlTemplateEngine: "njk",
    dataTemplateEngine: "njk"
  };
};
