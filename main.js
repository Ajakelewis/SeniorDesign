// Modules to control application life and create native Browser Window / read the path and Api URL
const {app, BrowserWindow} = require('electron');
const path = require('path');
const url = require('url');

let win;

// Create the browser window. 
function createWindow() {
    win = new BrowserWindow({width:800, height:600, icon:__dirname+'/img/logo.png'});

    // load the index.html of the app.
    win.loadURL(url.format({
        pathname: path.join(__dirname, 'index.html'),
        protocol: 'file:',
        slashes: true
    }));

    // Open the DevTools.
  // mainWindow.webContents.openDevTools()
    win.webContents.openDevTools();

    win.on('closed', () => {
        win = null;
    });
}
    // This method will be called when Electron has finished
    // initialization and is ready to create browser windows.
    // Some APIs can only be used after this event occurs.
app.on('ready', createWindow);

    // Quit when all windows are closed, except on macOS. There, it's common
    // for applications and their menu bar to stay active until the user quits
    // explicitly with Cmd + Q.
app.on('window-all-closed', () => {
    if(process.platform !== 'darwin'){
        app.quit();
    }
});
