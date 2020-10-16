var oracledb = require('oracledb');

oracledb.outFormat = oracledb.OUT_FORMAT_OBJECT;

connection = {
      user          : "CG_PROY_ADMIN",
      password      : "samjor",
      connectString : "cursodb.c7rbflvluzyk.us-east-2.rds.amazonaws.com:1521/SCOOTERS"
}

function error(err,rs,cn){
  if(err){
    console.log(err.message);
    rs.contentType('application/json').status(500);
    rs.send(err.message);
    if(cn!=null) close (cn);
    return -1;
  }
  else
    return 0;
}

function open(sql,binds,dml,rs){
  oracledb.getConnection(connection,function(err,cn){
    if(error(err,rs,null)==-1) return;
    cn.execute(sql,binds,{autoCommit: dml},function(err,result){
      if(error(err,rs,cn)==-1) return;
      rs.contentType('application/json').status(200);
      if(dml)
        rs.send(JSON.stringify(result.rowsAffected));
      else{
        console.log(result.metaData);
        rs.send(JSON.stringify(result.rows));
      }
      close(cn);
    });
  })
}

function close(cn){
  cn.release(
      function(err){
        if(err){
          console.error(err.message);
        }
      }
    );
}


exports.open = open;
exports.close = close;
