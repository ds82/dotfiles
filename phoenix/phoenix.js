require("./utils.js");

const HYPER = ["ctrl", "alt", "cmd"];
const STRG_CMD = ["ctrl", "cmd"];
const STRG_SHIFT = ["ctrl", "shift"];

const MINI_HOME = "kip-mini.or.lan";

const match = (pattern, searchIn) => searchIn && !!searchIn.match(pattern);
const last = (list = []) => list[list.length - 1];
const getScreens = () => Screen.all();

let hostname = "<unknown>";
run("/bin/hostname").then((h) => (hostname = h));

Phoenix.set({
  daemon: false,
  openAtLogin: true,
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

function toCenter(main, screen) {
  const size = main.size();
  const rec = screen.frame();

  const x = rec.x + rec.width / 2 - size.width / 2;
  const y = rec.y + rec.height / 2 - size.height / 2;

  Phoenix.log(`toCenter ${rec.x}, ${rec.width}, ${x} ${y}`);
  main.setTopLeft({ x, y });
}

const SIZES = {
  openhab: {
    width: 750,
    height: 1060,
  },
};

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

  const screens = Screen.all();
  const screensCount = screens.length;

  Screen.all().map((s, i) => {
    Phoenix.log(`${i}: ${s.frame().width} - x: ${s.frame().x}`);
  });

  // Phoenix.log("screens", screens);
  Phoenix.log(`app ${name} | ${stringify(main.frame())}`);

  const nameMatch = (what) => match(what, name);

  if (match(/tweetbot/i, name)) {
    main.setSize({ width: 1600, height: 1000 });
    toCenter(main, Screen.all()[0]);
  } else if (match(/messages/i, name)) {
    bottomRight(main, screens[1], 750, 390);

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
  } else if (nameMatch(/openhab/i)) {
    topRight(main, screens[1], 750, 1060);
  } else if (nameMatch(/teamspeak 3/i)) {
    const frame = screens[1].frame();
    main.setTopLeft({
      x: frame.x + frame.width - SIZES.openhab.width - 740,
      y: 0,
    });
    main.setSize({ width: 740, height: screens[1].frame().height });
  }
});

Event.on("appDidLaunch", (app) => {
  Phoenix.log("appDidLaunch", app.name());

  // if (app.name() && app.name().match(/tweetbot/i)) {
  //   Phoenix.log('found tweetbot ...');
  //   Phoenix.log('tweetbot windows', app.mainWindow());
  //   app.mainWindow().setFrame(100, 100, 50, 50);
  // }
});
