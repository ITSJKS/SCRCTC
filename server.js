const express = require('express');
const mysql = require('mysql2');
const connection = require('./db.js')
const bodyParser = require('body-parser');
const app = express();
var path = require('path');
app.use(bodyParser.urlencoded({ extended: true }));
const dir = __dirname;
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());


// view engine setup

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
// mysql connection


connection.connect(function (err) {
  if (err) console.log(err);
  console.log("Connected!");
});

// home route get enquiry path
app.get('/search', (req, res) => {
  res.render("search",{values:""});
})
// home route post enquiry path 
// these will store values of the searched query
let t_no ;
let from;
let to;
let date;
app.post('/search', (req, res) => {
  from = req.body.from;
  to = req.body.to;
  date = req.body.date;
  const sql = `Select * from railwaydb.trains where source = '${from}' and destination = '${to}'`;
  // console.log(sql);
  connection.query(sql, (err, result) => {
    
    if (result.length) {
      // t_no = result[0].train_no;
      res.render("results",{value:result})
      // res.redirect('booking');
    }
    else {
      res.render("search",{values:"No Trains Found between these stations."})
    }

  });
});

app.post('/results',(req,res)=>{
  console.log(req.body);
  t_no = req.body.check;
  console.log(t_no);
  res.redirect('booking');
})

app.get('/pnr_status',(req,res)=>{
  res.render("pnr_status",{values:""});
});

// pnr status routes 
app.post('/pnr_status',(req,res)=>{
  console.log(req.body);
  let enquiry_pnr = req.body.pnr;
  console.log(enquiry_pnr);
  let enquiry = `select * from ticket where pnr = ${enquiry_pnr}`;
  connection.query(enquiry,(err,result)=>{
    if(err) throw err;
    if(result.length){
      let ticket  = `select b.name ,b.gender,b.age, a.pnr,a.train_no,a.destination,a.source ,a.train_name,a.arrival_time, a.departure_time, a.seat_no, a.date from railwaydb.passenger as b , railwaydb.ticket as a where b.id = ${enquiry_pnr} and a.pnr = ${enquiry_pnr}`;
      connection.query(ticket,(err,result1)=>{
        if(err) throw err;
        // b.name ,b.gender,b.age, a.pnr,a.train_no,a.destination,a.source ,a.train_name,a.arrival_time, a.departure_time
        console.log(result1);
        let new_date = (result1[0].date);
        let new_date1 = new_date.getFullYear()+'-' + (new_date.getMonth()+1) + '-'+new_date.getDate();
        res.render("ticket",{
          name:result1[0].name,
          gender:result1[0].gender,
          pnr:result1[0].pnr,
          age:result1[0].age,
          destination:result1[0].destination,
          train_no :result1[0].train_no,
          source:result1[0].source,
          train_name :result1[0].train_name,
          arrival_time :result1[0].arrival_time,
          departure_time :result1[0].departure_time,
          date:new_date1,
          seat_no:result1[0].seat_no
        });
      });
    }    
    else{
      res.render("pnr_status",{values:"There is no ticket with this PNR number."});
    }
  })
})


app.get('/',(req,res)=>{
  res.render('index');
})


// booking route get path

app.get('/booking', (req, res) => { res.render("booking") });

// booking route post path
app.post('/booking', (req, res) => {
  let PNR = 40000000 + Math.ceil(Math.random() * 1000000);
  let name = req.body.name;
  let DEST = `select * from railwaydb.trains where train_no = ${t_no}`;
  // console.log(DEST);
  let gender = req.body.gender;
  let age = req.body.age;
  var train_name;
  var source;
  var destination;
  var arrival_time;
  var departure_time;
  var available_seats;

  connection.query(DEST, (err, result) => {
    train_name = result[0].train_name;
    source = result[0].source;
    destination = result[0].destination;
    arrival_time = result[0].source_time;
    departure_time = result[0].destination_time;
    available_seats= result[0].available_seats;
    let booking = `INSERT INTO railwaydb.ticket values(${PNR},'${destination}','${source}','${train_name}',${t_no},'${arrival_time}','${departure_time}','${date}',${available_seats})`;
    // console.log(booking);
    connection.query(booking, (err, result) => {
      if (err) throw err;
      // res.send("Your ticket has been booked successfully.");
      // console.log(result);
    });


    let passenger = `INSERT INTO railwaydb.passenger values(${PNR},'${name}','${gender}',${age})`;
    connection.query(passenger, (err,result) => {
      if(err) throw err;
      // console.log(result);
      let ticket  = `select b.name ,b.gender,b.age, a.pnr,a.train_no,a.destination,a.source ,a.train_name,a.arrival_time, a.departure_time, a.seat_no, a.date from railwaydb.passenger as b , railwaydb.ticket as a where b.id = ${PNR} and a.pnr = ${PNR}`;
      connection.query(ticket,(err,result1)=>{
        if(err) throw err;
        let update_seats = `update trains set available_seats = available_seats - 1  where train_no = ${t_no}`;
        connection.query(update_seats,(err,result2)=>{
          if(err) throw err;
        });
        // b.name ,b.gender,b.age, a.pnr,a.train_no,a.destination,a.source ,a.train_name,a.arrival_time, a.departure_time
        console.log(result1);
        let new_date = (result1[0].date);
        let new_date1 = new_date.getFullYear()+'-' + (new_date.getMonth()+1) + '-'+new_date.getDate();
        res.render("ticket",{
          name:result1[0].name,
          gender:result1[0].gender,
          pnr:result1[0].pnr,
          age:result1[0].age,
          destination:result1[0].destination,
          train_no :result1[0].train_no,
          source:result1[0].source,
          train_name :result1[0].train_name,
          arrival_time :result1[0].arrival_time,
          departure_time :result1[0].departure_time,
          date:new_date1,
          seat_no:result1[0].seat_no
        });
      });
    });

  });
}
);

app.get('/about', (req, res) => { res.render("about") });

app.listen(3000, () => console.log("Server is now running at port 3000"));
