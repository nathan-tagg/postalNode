const cool = require('cool-ascii-faces')
const express = require('express')
const path = require('path')
const url = require('url')
const PORT = process.env.PORT || 5000

express()
  .use(express.static(path.join(__dirname, 'public')))
  .set('views', path.join(__dirname, 'views'))
  .set('view engine', 'ejs')
  .get('/', (req, res) => res.render('pages/index'))
  .get('/cool', (req, res) => res.send(cool()))
  .get('/calculatePostage', function (request, response) {handleMath(request, response);})
  .listen(PORT, () => console.log(`Listening on ${ PORT }`))

  function handleMath(request, response) {
         var requestUrl = url.parse(request.url, true);

         var weight = Number(requestUrl.query.oz);
         var shipmentType = requestUrl.query.shipmentType;

         calculate(response, weight, shipmentType);
     }

     function calculate(response, weight, shipmentType) {
       var dollars = 0;
       var cents = 0;
       if (shipmentType == 'letter_stamped') {
         shipmentType = 'letter';
         if (weight <= 1) {
           cents = 50;
         } else if (weight <= 2) {
           cents = 71;
         } else if (weight <= 3) {
           cents = 92;
         } else if (weight <= 3.5) {
           dollars = 1;
           cents = 13;
         }
         else {
           var params = {errorMessage: 'Letter too heavy. Stamped letters must be under 3.5 oz.'};
           response.render('pages/error', params);
           return;
         }
       } else if (shipmentType == 'letter_metered') {
         shipmentType = 'letter';
         if (weight <= 1) {
           cents = 47;
         } else if (weight <= 2) {
           cents = 68;
         } else if (weight <= 3) {
           cents = 89 ;
         } else if (weight <= 3.5) {
           dollars = 1;
           cents = 10;
         } else {
           var params = {errorMessage: 'Letter too heavy. Metered letters must be under 3.5 oz.'};
           response.render('pages/error', params);
           return;
         }
       } else if (shipmentType == 'large_envelope') {
         shipmentType = 'envelope';
         if (weight <= 1) {
           dollars = 1;
           cents = 00;
         } else if (weight <= 2) {
           dollars = 1;
           cents = 21;
         } else if (weight <= 3) {
           dollars = 1;
           cents = 42;
         } else if (weight <= 4) {
           dollars = 1;
           cents = 63;
         } else if (weight <= 5) {
           dollars = 1;
           cents = 84;
         } else if (weight <= 6) {
           dollars = 2;
           cents = 05;
         } else if (weight <= 7) {
           dollars = 2;
           cents = 26;
         } else if (weight <= 8) {
           dollars = 2;
           cents = 47;
         } else if (weight <= 9) {
           dollars = 2;
           cents = 68;
         } else if (weight <= 10) {
           dollars = 2;
           cents = 89;
         } else if (weight <= 11) {
           dollars = 3;
           cents = 10;
         } else if (weight <= 12) {
           dollars = 3;
           cents = 31;
         } else if (weight <= 13) {
           dollars = 3;
           cents = 52;
         } else {
           var params = {errorMessage: 'Envelope too heavy. Large envelopes must be under 13 oz.'};
           response.render('pages/error', params);
           return;
         }
      } else if (shipmentType == 'first_class_package') {
        shipmentType = 'first class package';
        if (weight <= 1) {
          dollars = 3;
          cents = 50;
        } else if (weight <= 2) {
          dollars = 3;
          cents = 50;
        } else if (weight <= 3) {
          dollars = 3;
          cents = 50;
        } else if (weight <= 4) {
          dollars = 3;
          cents = 50;
        } else if (weight <= 5) {
          dollars = 3;
          cents = 75;
        } else if (weight <= 6) {
          dollars = 3;
          cents = 75;
        } else if (weight <= 7) {
          dollars = 3;
          cents = 75;
        } else if (weight <= 8) {
          dollars = 3;
          cents = 75;
        } else if (weight <= 9) {
          dollars = 4;
          cents = 10;
        } else if (weight <= 10) {
          dollars = 4;
          cents = 45;
        } else if (weight <= 11) {
          dollars = 4;
          cents = 80;
        } else if (weight <= 12) {
          dollars = 5;
          cents = 15;
        } else if (weight <= 13) {
          dollars = 5;
          cents = 50;
        } else {
          var params = {errorMessage: 'Package too heavy. First class packages must be under 13 oz.'};
          response.render('pages/error', params);
          return;
        }
     }
     var params = {oz: weight, shipmentType: shipmentType, dollars: dollars, cents: cents};
     response.render('pages/result', params);
  }
