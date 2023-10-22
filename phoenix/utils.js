function run(command, args = []) {
  return new Promise((resolve, reject) => {
    Task.run(command, args, (t) => {
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

function stringify(something) {
  return JSON.stringify(something);
}

function bottomRight(window, screen, width, height) {
  const frame = screen.frame();
  const x = frame.width - width + frame.x;
  const y = frame.height - height + frame.y;

  window.setSize({ width, height });
  window.setTopLeft({ x, y });
}

function topRight(window, screen, width, height) {
  const frame = screen.frame();
  const x = frame.width - width + frame.x;

  window.setSize({ width, height });
  window.setTopLeft({ x, y: 0 });
}
