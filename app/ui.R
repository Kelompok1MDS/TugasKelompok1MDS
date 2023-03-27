library(shiny)
library(shinydashboard)
library(RPostgreSQL)
library(DBI)
library(DT)
library(plotly)

dashboardPage(skin = 'green',
  title = "Hotel Reservation IS",
  dashboardHeader(
    title = "Hotel Reservation IS"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", startExpanded = TRUE, icon = icon("heart-pulse"),
               menuSubItem("Tim Pengembang", tabName = "kelompok", icon = icon("users"),),
               menuSubItem("Grafik Pengunjung", tabName = "pengunjung",icon = icon("chart-line")),
               menuSubItem("Grafik Tagihan", tabName = "tagihan",icon = icon("chart-column"))
      ),
      menuItem(
        text = " Data Hotel",
        tabName = "hotel",
        icon = icon("hotel")
      ),
      menuItem(
        text = " Data Guest",
        tabName = "guest",
        icon = icon("user")
      ),
      menuItem(
        text = " Data Reservation Agent",
        tabName = "reservation_agent",
        icon = icon("user-ninja")
      ),
      menuItem(
        text = "Data Kamar",
        tabName = "rooms",
        icon = icon("bed")
      ),
      menuItem(
        "Riwayat Pemesanan",
        tabName = "riwayat",
        icon = icon("money-bill-trend-up")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "Dashboard",
              h1(
                "Dashboard"
              ),
      ),
      tabItem(tabName = "kelompok",
              h2("Tim Pengembang"),
              tags$p(
                "Sistem Informasi Pemesanan Tiket Hotel ini dikembangkan sebagai tugas Praktikum Mata Kuliah Manajemen Data Statistika."
              ),
              tags$ul(
                tags$li(img(src="https://user-images.githubusercontent.com/111561203/227850526-85963b40-de8b-442e-b180-11f294bdefff.png", width = 100), "Data Manager : Irsyifa Mayzela Afnan G1501222062"),
                tags$li(img(src="https://user-images.githubusercontent.com/111561203/227850496-12801984-80b0-4940-8f54-704a9eb74d2c.png", width = 100), "Shiny Developer (Backend) : Teguh Prasetyo G1501220131"),
                tags$li(img(src="https://user-images.githubusercontent.com/111561203/227850560-4046c2ae-76ea-49e9-847d-7ce7a3113407.png", width = 100), "Shiny Developer (Frontend) : Dini Ramadhani G1501221006"),
                tags$li(img(src="https://user-images.githubusercontent.com/111561203/227850602-2c7eb4c0-0eea-4fe5-80e3-c9793cc7d3b4.png", width = 100), "Technical Writer : Adeline Vinda Septiani G1501221016"),
              ),
              div(style="display: inline-block; margin-left:40px; margin-right:50px; 
                width: 33%; margin-bottom:10px; margin-top:50px",
                  img(src="https://thumbs.dreamstime.com/b/online-hotel-booking-laptop-holiday-icons-vacation-concept-renting-accommodations-book-button-bed-icon-screen-vector-103003989.jpg", width = 500)),
              tags$p(style='margin-left:40px', "Sumber: https://thumbs.dreamstime.com/")
      ),
      tabItem(tabName = "pengunjung",
              h2("Grafik Pengunjung berdasarkan Hotel"),
              plotlyOutput(
              outputId = "tblGrafik",
              width = "100%",
              height = "400px")
      ),
      tabItem(tabName = "tagihan", 
                    h2("Grafik Tagihan berdasarkan Pengunjung"),
                    plotlyOutput(
                      outputId = "tblTagihan",
                      width = "100%",
                      height = "400px")
      ),
      tabItem(
        tabName = "hotel",
        h1(
          "Data Hotel"
        ),
        dataTableOutput(
          outputId = "Hotels"
        )
      ),
      tabItem(
        tabName = "guest",
        h1(
          "Data Guest"
        ),
        dataTableOutput(
          outputId = "Guest"
        )
      ),
      tabItem(
        tabName = "reservation_agent",
        h1(
          "Data Reservation Agent"
        ),
        dataTableOutput(
          outputId = "ReservationAgent"
        )
      ),
      tabItem(
        tabName = "rooms",
        h1(
          "Data Kamar"
        ),
        dataTableOutput(
          outputId = "Rooms"
        )
      ),
      tabItem(
        tabName = "riwayat",
        h2(
          "Riwayat Pemesanan berdasarkan Hotel"
        ),
        uiOutput("loadHotel"),
        dataTableOutput(
          outputId = "tblRiwayat"
        )
      )
    )
  )
)