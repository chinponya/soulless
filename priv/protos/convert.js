import { liqi } from "./dhs.js"

const text = JSON.stringify(liqi)
await Deno.writeTextFile("dhs.json", text)
