module.exports = function (config) {
    config.set({
      frameworks: ['jasmine'], // Usamos el framework Jasmine
      browsers: ['FireFox'], // Usamos el navegador Google Chrome, puedes cambiarlo si prefieres otro
      reporters: ['progress', 'coverage-istanbul'], // Informes de progreso y cobertura
      coverageIstanbulReporter: {
        reports: ['html', 'lcovonly', 'text-summary'],
        fixWebpackSourcePaths: true
      },
      files: [
        // Aquí debes listar los archivos que contienen tus pruebas unitarias
        'src/app/app.component.spec.ts',
        'src/app/proyecto-api.service.spec.ts'
      ],
      preprocessors: {
        'src/app/app.component.spec.ts': ['webpack', 'sourcemap']
      },
      webpack: {
        // Configuración de Webpack para compilar tus pruebas
        module: {
          rules: [
            {
              test: /\.ts$/,
              use: 'ts-loader'
            }
          ]
        },
        resolve: {
          extensions: ['.ts', '.js']
        }
      },
      singleRun: true
    });
  };
  