const csv = require('csvtojson');
const fs = require('fs');
const resultsPath = '../../.tmp/results/';

let data = {};

async function parse(file) {
  const partial = file.split('|');
  const scenario = partial[0];
  const stack = partial[1].replace('.csv', '');
  console.log(scenario, stack);

  const results = await csv().fromFile(resultsPath + file);

  data[scenario] = data[scenario] || {};
  data[scenario][stack] = extract(results);
}

function extract(results) {
  const stackResults = {};
  const keys = Object.keys(results[0]);
  keys.forEach(key => stackResults[key] = []);
  results.forEach(row => {
    keys.forEach(key => stackResults[key].push(parseFloat(row[key])));
  })
  return stackResults;
}

async function build() {
  const files = await fs.readdirSync(resultsPath);
  for (let i = 0; i < files.length; i++) {
    await parse(files[i]);
  }
  await fs.writeFileSync('src/assets/results.json', JSON.stringify(data));
  console.log('Data generated!')
}

build();
