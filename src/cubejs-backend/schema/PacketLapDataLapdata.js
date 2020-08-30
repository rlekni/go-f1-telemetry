cube(`PacketLapDataLapdata`, {
  sql: `SELECT * FROM f12020telemetry.packetLapData_lapdata`,
  refreshKey: {
    sql: `SELECT UNIX_TIMESTAMP()`
  },
  joins: {},

  measures: {
    count: {
      type: `count`,
      drillMembers: []
    },
    playerCount: {
      sql: `_id`,
      type: `count`,
      filters: [
        { sql: `${CUBE}.lapdata_idx = 19` }
      ]
    }
  },

  dimensions: {}
});
