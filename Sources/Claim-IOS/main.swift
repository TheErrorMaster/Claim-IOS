import Kitura
import Cocoa

let router = Router()

router.all("/ClaimService/add", middleware: BodyParser())

router.get("/"){
    request, response, next in
    response.send("<h1>Hello! Welcome to visit the service.</h1>")
    next()
}

router.get("ClaimService/getAll"){
    request, response, next in
    let pList = ClaimDao().getAll()
    // JSON Serialization
    let jsonData : Data = try JSONEncoder().encode(pList)
    //JSONArray
    let jsonStr = String(data: jsonData, encoding: .utf8)
    // set Content-Type
    response.status(.OK)
    response.headers["Content-Type"] = "application/json"
    response.send(jsonStr)
    //response.send("getAll service response data : \(pList.description)")
    next()
}

router.post("ClaimService/add") {
    request, response, next in
    // JSON deserialization on Kitura server
    let body = request.body
    let jObj = body?.asJSON //JSON object
    if let jDict = jObj as? [String:String] {
        if let tit = jDict["title"],let da = jDict["date"] {
            let pObj = Claim(tit:tit, da:da)
            ClaimDao().addClaim(pObj: pObj)
        }
        else {
            print("need all para")
        }
    }
    else {
        print("no it didn't")
    }
    response.send("The Claim record was successfully inserted (via POST Method).")
    print("went thru")
    next()
}

Kitura.addHTTPServer(onPort: 8020, with: router)
Kitura.run()
