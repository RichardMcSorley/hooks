const gith = require("gith").create(6000); // run on port 6000
const exec = require("child_process").exec;
const GIT = require("nodegit");
const compose = require("docker-compose");
const path = require("path");
gith({
  repo: "RichardMcSorley/youtube-puppeteer" // the github-user/repo-name
}).on("all", function(payload) {
  console.log("push received ");
  exec("sh hooks.sh " + payload.branch, function(err, stdout, stderr) {
    if (err) {
      console.log("error", err);
      console.log("stderr", stderr);
      return err;
    }
    if (stderr) {
      console.log("stderr", stderr);
      return stderr;
    }
    console.log(stdout);
    console.log("Deployed!");
  });
});
console.log("Hooks is listening on port: 6000");

const runIt = async () => {
  await GIT.Clone(
    "https://github.com/RichardMcSorley/youtube-puppeteer",
    "youtube-puppeteer"
  );
  console.log("cloned");
  await compose.buildAll({ cwd: path.join(__dirname, "youtube-puppeteer") });
  console.log("built");
  await compose.upAll({
    cwd: path.join(__dirname, "youtube-puppeteer"),
    log: true
  });
  console.log("upd");
};
runIt();
