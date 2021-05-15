require("./utils.js");

const HYPER = ["ctrl", "alt", "cmd"];
const STRG_CMD = ["ctrl", "cmd"];
const STRG_SHIFT = ["ctrl", "shift"];

const MINI_HOME = "kip-mini.or.lan";

const match = (pattern, searchIn) => searchIn && !!searchIn.match(pattern);
const last = (list = []) => list[list.length - 1];
const getScreens = () => Screen.all();

let hostname = "<unknown>";
run("/bin/hostname").then(h => (hostname = h));

Phoenix.set({
  daemon: false,
  openAtLogin: true
});

Key.on("m", HYPER, () => {
  const window = Window.focused();
  if (!window) return;
  window.maximize();
});

/*
  move window right
*/
Key.on("right", STRG_CMD, () => {
  const window = Window.focused();
  if (!window) {
    return;
  }

  const screen = window.screen();
  const frame = screen.frame();

  const topLeft = window.topLeft();
  const xNext = topLeft.x + frame.width;

  window.setTopLeft({ x: xNext, y: topLeft.y });
});

/*
  move window left
*/
Key.on("left", STRG_CMD, () => {
  const window = Window.focused();
  if (!window) {
    return;
  }

  const screen = window.screen();
  const frame = screen.frame();

  const topLeft = window.topLeft();
  const xNext = Math.max(0, topLeft.x - frame.width);

  window.setTopLeft({ x: xNext, y: topLeft.y });
});

/*
  move & resize window to left screen half
*/
Key.on("left", STRG_SHIFT, () => {
  const window = Window.focused();
  if (!window) {
    return;
  }
});

Event.on("appDidActivate", () => {
  const window = Window.focused();
  if (!window) {
    return;
  }

  const app = window.app();

  if (!app) {
    return;
  }

  const name = app.name();
  const main = app.mainWindow();
  if (!main) {
    return;
  }

  if (match(/tweetbot/i, name)) {
    // const screens = Screen.all().length;
    // main.setTopLeft({ x: 1920 * 2 - 500, y: 20 });
    // main.setSize({ width: 500, height: 1180 });
  } else if (match(/messages/i, name)) {
    // main.setTopLeft({ x: 1920 * 2 - 500, y: 20 });
    // main.setSize({ width: 500, height: 400 });
  // } else if (hostname !== MINI_HOME && match(/.*openhab/i, name)) {
  //   const screens = getScreens();
  //   const overallWidth = screens.reduce(
  //     (acc, screen) => acc + screen.frame().width,
  //     0
  //   );
  //   const width = 765;
  //   const height = last(screens).height;
  //
  //   Phoenix.log(
  //     "found openhab ..." + overallWidth + " " + hostname,
  //     hostname !== MINI_HOME
  //   );
  //
  //   main.setTopLeft({ x: overallWidth - width, y: 20 });
  //   main.setSize({ width, height });
  } else if (match(/.*franz/i, name)) {
    // const width = 845;
    // main.setTopLeft({ x: 1920 * 2 - width, y: 20 });
    // main.setSize({ width, height: 600 });
  }
});

Event.on("appDidLaunch", app => {
  Phoenix.log("appDidLaunch", app.name());

  // if (app.name() && app.name().match(/tweetbot/i)) {
  //   Phoenix.log('found tweetbot ...');
  //   Phoenix.log('tweetbot windows', app.mainWindow());
  //   app.mainWindow().setFrame(100, 100, 50, 50);
  // }
});
