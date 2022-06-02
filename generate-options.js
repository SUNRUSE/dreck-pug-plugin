const fs = require("fs");

const output = {};

for (const inputPath of process.argv.slice(2)) {
  const inputData = fs.readFileSync(inputPath, "utf8");

  output[inputPath] = inputData;
}

fs.writeFileSync("./plugins/pug/generated-options.json", JSON.stringify(output), "utf8");
