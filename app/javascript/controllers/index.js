import { application } from "./application"

import AirportSearchController from "./airport_search_controller"
application.register("airport-search", AirportSearchController)

import ChatController from "./chat_controller"
application.register("chat", ChatController)
