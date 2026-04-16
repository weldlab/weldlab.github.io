module.exports = function (eleventyConfig) {
  eleventyConfig.addPassthroughCopy("**/*.css");
  eleventyConfig.addPassthroughCopy("**/*.pdf");
  eleventyConfig.addPassthroughCopy("**/*.mp4");
}

