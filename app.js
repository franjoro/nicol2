const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const app = express();
const winston = require('./config/winston');

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use("/static", express.static(`${__dirname}/public`));


// variables de rutas
const indexRouter = require('./routes/main.router');
const admin = require('./routes/admin/admin.router');
const alumnos = require('./routes/alumnos/alumnos.router');
const maestros = require('./routes/maestros/maestros.router');

// Asignar rutas
app.use('/', indexRouter);
app.use('/admin', admin);
app.use('/alumnos', alumnos);
app.use('/maestros', maestros);



// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
  // add this line to include winston logging
  winston.error(`${err.status || 500} - ${err.message} - ${req.originalUrl} - ${req.method} - ${req.ip}`);
  // render the error page
  res.status(err.status || 500);
  res.render('error');
});


module.exports = app;
