//
//  Created by Mauricio Macias on 10/15/20.
//

import Foundation
import SQLite3

struct Claim : Codable {
    var uuid : String?
    var title : String?
    var date : String?
    var isSolved : String?
    
    init(tit:String?, da: String?) {
        uuid = UUID().uuidString // initialized as uuid
        title = tit
        date = da
        isSolved = "0" // initialized as false and integer
    }
}
class ClaimDao{
    func addClaim(pObj : Claim) {
        let sqlStmt = String(format:"insert into claim (uuid,title, date, solve) values ('%@','%@','%@', '%@')",(pObj.uuid)!,(pObj.title)!, (pObj.date)!, (pObj.isSolved)!)
        // get database connection
        let conn = Database.getInstance().getDbConnection()
        // submit the insert sql statement
        if sqlite3_exec(conn, sqlStmt, nil, nil, nil) != SQLITE_OK {
            let errcode = sqlite3_errcode(conn)
            print("Failed to insert a Claim record due to error \(errcode)")
        }
        // close the connection
        print("connected")
        sqlite3_close(conn)
    }
    
    func getAll() -> [Claim] {
        var pList = [Claim]()
        var resultSet : OpaquePointer?
        let sqlStr = "select uuid, title, date, solve from claim"
        let conn = Database.getInstance().getDbConnection()
        if sqlite3_prepare_v2(conn, sqlStr, -1, &resultSet, nil) == SQLITE_OK {
            while(sqlite3_step(resultSet) == SQLITE_ROW) {
                // Convert the record into a Person object
                // Unsafe_Pointer<CChar> Sqlite3
//                let id_val = sqlite3_column_text(resultSet, 0)
//                let id = String(cString: id_val!)
                let tit_val = sqlite3_column_text(resultSet, 1)
                let tit = String(cString: tit_val!)
                let da_val = sqlite3_column_text(resultSet, 2)
                let da = String(cString: da_val!)
//                let sol_val = sqlite3_column_text(resultSet, 3)
//                let sol = String(cString: sol_val!)
                pList.append(Claim(tit:tit, da:da))
            }
        }
        return pList
    }
}
