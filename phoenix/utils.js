function run(command, args = []) {
  return new Promise((resolve, reject) => {
    Task.run(command, args, t => {
      if (t.status === 0) {
        return resolve(String(t.output).trim());
      } else {
        return reject(`could not execute command to fetch '$${name}'`);
      }
    });
  });
}

function getEnv(name = "") {
  return run("/bin/sh", ["-c", `echo "$${name}"`]);
}
