const HYPER = ['ctrl', 'alt', 'cmd'];

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
  if (!main) {
    return;
  }

  if (match(/tweetbot/i, name)) {
    main.setTopLeft({ x: 1920 * 2 - 500, y: 20 });
    main.setSize({ width: 500, height: 1180 });
  } else if (match(/messages/i, name)) {
    main.setTopLeft({ x: 1920 * 2 - 500, y: 20 });
    main.setSize({ width: 500, height: 400 });
  } else if (match(/.*openhab/i, name)) {
    const width = 845;
    main.setTopLeft({ x: 1920 * 2 - width, y: 20 });
    main.setSize({ width, height: 1180 });
  } else if (match(/.*franz/i, name)) {
    const width = 845;
    main.setTopLeft({ x: 1920 * 2 - width, y: 20 });
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
