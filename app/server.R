connectDB <- function(){
  driver <- dbDriver('PostgreSQL')
  
# Set up connection versi local database  
#  DB <- dbConnect(
#  driver, dbname="reservasi_hotel", host="localhost",port=5432,user="postgres", password="teguhprasetyo"
  
# Set up connection to ElephantSQL server database
DB <- dbConnect(
    driver,
    dbname="ypzjuyva", # User & Default database
    host="topsy.db.elephantsql.com", # Server
    # port=5432,
    user="ypzjuyva", # User & Default database
    password="Fn_rNyFiW2dMSyHhOrzcFivZP7Ile_Vh" # Password  
  )
}


function(input, output, session) {
    output$tblGrafik <- renderPlotly({
    DB <- connectDB()
    jumlahbooking <- dbGetQuery(DB, "SELECT h.hotel_id, h.hotelname,
	                COUNT(*) AS jumlah_booking
                  FROM hotels AS h, bookings AS b
                  WHERE h.hotel_id=b.hotel_id
                  GROUP BY h.hotelname, h.hotel_id
                  ORDER BY h.hotel_id
                  ;")
    xhotelname <- list(categoryorder = "array",
                       categoryarray = jumlahbooking$hotelname)
    plothotel <- plot_ly(x=jumlahbooking$hotelname,y=jumlahbooking$jumlah_booking,type="bar") %>%
      layout(title = "",
             xaxis = xhotelname)
    dbDisconnect(DB)
    plothotel
  })
    
  output$tblTagihan <- renderPlotly({
    DB <- connectDB()
    jumlahbayar <- dbGetQuery(DB, "SELECT g.firstname, g.lastname,
	                SUM(b.roomcount*h.price) AS jumlah_bayar
                  FROM guest AS g, hotels AS h, bookings AS b
                  WHERE h.hotel_id=b.hotel_id AND g.guest_id=b.guest_id
                  GROUP BY g.firstname, g.lastname
                  ORDER BY g.firstname
                  ;")
    xhotelbayar <- list(categoryorder = "array",
                        categoryarray = jumlahbayar$firstname)
    plotbayar <- plot_ly(x=jumlahbayar$firstname,y=jumlahbayar$jumlah_bayar,type="bar",color='lifeExp',text_auto='.2s') %>%
      layout(title = "",
             xaxis = xhotelbayar)
    dbDisconnect(DB)
    plotbayar
  })
  
  output$Hotels <- renderDataTable({
    DB <- connectDB()
    hotels<-dbReadTable(DB, 'hotels')
    dbDisconnect(DB)
    
    hotels
  })
  
  output$Guest <- renderDataTable({
    DB <- connectDB()
    guest<-dbReadTable(DB, 'guest')
    dbDisconnect(DB)
    
    guest
  })
  
  output$ReservationAgent <- renderDataTable({
    DB <- connectDB()
    reservation_agent<-dbReadTable(DB, 'reservation_agent')
    dbDisconnect(DB)
    
    reservation_agent
  })
  
  output$Rooms <- renderDataTable({
    DB <- connectDB()
    rooms<-dbReadTable(DB, 'rooms')
    dbDisconnect(DB)
    
    rooms
  })
  
  listDr <- reactive({
    DB <- connectDB()
    hotels<-dbReadTable(DB, 'hotels')
    dbDisconnect(DB)
    
    hotels$hotelname
  })
  
  output$loadHotel <- renderUI({
    selectInput("listHotel", "Hotel", choices = listDr())
  })
  
  output$tblRiwayat <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT
	                g.firstname, 
	                g.lastname, 
	                g.gender, 
	                h.hotelname,
	                b.startdate,
	                b.enddate 
                FROM
	                bookings AS b,
	                guest AS g,
	                hotels AS h
                WHERE
	                b.hotel_id=h.hotel_id
	                AND
	                g.guest_id=b.guest_id
                  AND 
                  h.hotelname = '", as.character(input$listHotel), "';")
    rs <- dbGetQuery(DB, q)  
    
    dbDisconnect(DB)
    
    rs
  })
}