import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "results"]

  connect() {
    this.timeout = null
  }

  search() {
    clearTimeout(this.timeout)
    
    const query = this.inputTarget.value.trim()
    
    if (query.length < 2) {
      this.hideResults()
      return
    }

    this.timeout = setTimeout(() => {
      this.performSearch(query)
    }, 300)
  }

  async performSearch(query) {
    try {
      const response = await fetch(`/airports/search?q=${encodeURIComponent(query)}`)
      const airports = await response.json()
      
      this.displayResults(airports)
    } catch (error) {
      console.error("Search error:", error)
    }
  }

  displayResults(airports) {
    if (airports.length === 0) {
      this.hideResults()
      return
    }

    const html = airports.map(airport => `
      <a href="/rooms/${airport.code}" 
         class="block p-4 hover:bg-blue-50 border-b last:border-b-0 transition">
        <div class="font-semibold text-gray-800">${airport.code} - ${airport.name}</div>
        <div class="text-sm text-gray-600">${airport.city}, ${airport.country}</div>
      </a>
    `).join('')

    this.resultsTarget.innerHTML = html
    this.showResults()
  }

  showResults() {
    this.resultsTarget.classList.remove("hidden")
  }

  hideResults() {
    this.resultsTarget.classList.add("hidden")
  }
}
