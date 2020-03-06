# 1. Install package by npm
npm install

# 2. Run test case
npm test feature/test.feature

npm test feature/*.feature

# 3. Run report
npm test feature/*.feature -f json:feature/report/cucumber-report.json

node feature/report/index.js