const HYPER = ['ctrl', 'alt', 'cmd'];
const STRG_CMD = ['ctrl', 'cmd'];

const match = (pattern, searchIn) => searchIn && !!searchIn.match(pattern);

Phoenix.set({
  daemon: false,
  openAtLogin: true
});

Key.on('m', HYPER, () => {
  const window = Window.focused();
  if (!window) return;
  window.maximize();
});

/*
  move window right
*/
Key.on('right', STRG_CMD, () => {
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
Key.on('left', STRG_CMD, () => {
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

Event.on('appDidActivate', () => {
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
  const { width, height } = main.size();
  const screens = Screen.all();

  const [overallWidth, overallHeight] = screens
    .map(s => s.frame())
    .reduce(([w, h], { width, height }) => [w + width, h + height], [0, 0]);
  // Phoenix.log(JSON.stringify(overallWidth));

  if (!main) {
    return;
  }

  if (match(/tweetbot/i, name)) {
    main.setTopLeft({ x: overallWidth - 500, y: 20 });
    main.setSize({ width: 500, height: 1180 });
  } else if (match(/messages/i, name)) {
    main.setTopLeft({ x: overallWidth - 500, y: 20 });
    main.setSize({ width: 500, height: 400 });
  } else if (match(/.*openhab/i, name)) {
    const width = 845;
    main.setTopLeft({ x: overallWidth - width, y: 20 });
    main.setSize({ width, height: 1180 });
  } else if (match(/.*franz/i, name)) {
    const width = 845;
    main.setTopLeft({ x: overallWidth - width, y: 20 });
    main.setSize({ width, height: 600 });
  }
});

Event.on('appDidLaunch', app => {
  Phoenix.log('appDidLaunch', app.name());

  // if (app.name() && app.name().match(/tweetbot/i)) {
  //   Phoenix.log('found tweetbot ...');
  //   Phoenix.log('tweetbot windows', app.mainWindow());
  //   app.mainWindow().setFrame(100, 100, 50, 50);
  // }
});
