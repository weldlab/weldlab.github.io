module.exports = function (eleventyConfig) {
  eleventyConfig.addGlobalData("layout", "base.njk");
  eleventyConfig.addPassthroughCopy("**/*.css");
  eleventyConfig.addPassthroughCopy("**/*.svg");
  eleventyConfig.addPassthroughCopy("**/*.pdf");
  eleventyConfig.addPassthroughCopy("**/*.mp4");
}

