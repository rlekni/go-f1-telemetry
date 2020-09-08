<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-4">
        <query-builder :cubejs-api="cubejsApi" :query="totalLapdataQuery">
          <template v-slot="{ loading, resultSet }">
            <Chart title="Total Lapdata events" type="number" :loading="loading" :result-set="resultSet"/>
          </template>
        </query-builder>
      </div>
      <div class="col-sm-4">
        <query-builder :cubejs-api="cubejsApi" :query="totalLapdataPacketsQuery">
          <template v-slot="{ loading, resultSet }">
            <Chart title="Total Lapdata Packets" type="number" :loading="loading" :result-set="resultSet"/>
          </template>
        </query-builder>
      </div>
      <!-- <div class="col-sm-4">
        <query-builder :cubejs-api="cubejsApi" :query="shippedOrdersQuery">
          <template v-slot="{ loading, resultSet }">
            <Chart title="Shipped Users" type="number" :loading="loading" :result-set="resultSet"/>
          </template>
        </query-builder>
      </div> -->
    </div>
    <br>
    <br>
    <!-- <div class="row">
      <div class="col-sm-6">
        <query-builder :cubejs-api="cubejsApi" :query="lineQuery">
          <template v-slot="{ loading, resultSet }">
            <Chart
              title="New Users Over Time"
              type="line"
              :loading="loading"
              :result-set="resultSet"
            />
          </template>
        </query-builder>
      </div>
      <div class="col-sm-6">
        <query-builder :cubejs-api="cubejsApi" :query="barQuery">
          <template v-slot="{ loading, resultSet }">
            <Chart
              title="Orders by Status Over time"
              type="stackedBar"
              :loading="loading"
              :result-set="resultSet"
            />
          </template>
        </query-builder>
      </div>
    </div> -->
  </div>
</template>

<script>
import cubejs from "@cubejs-client/core";
import WebSocketTransport from '@cubejs-client/ws-transport';
import { QueryBuilder } from "@cubejs-client/vue";

import Chart from "./components/Chart";
const API_URL = 'ws://localhost:4000/';
const CUBEJS_TOKEN =
  'c4f91d197aa805fc0ed0949cf2a7c594e7b6d8c6828a6b2b29f6919ecaa693214f9a4f1756af99c81fc6df163709bd1524b252d0ccf757f5bdc5e7a71b39e0bc';

const cubejsApi = cubejs({
  transport: new WebSocketTransport({ authorization: CUBEJS_TOKEN, apiUrl: API_URL })
});

cubejsApi.subscribe({
  measures: ['PacketLapData.count'],
  // timeDimensions: [{
  //   dimension: 'Logs.time',
  //   granularity: 'hour',
  //   dateRange: 'last 1440 minutes'
  // }]
},{/*options*/}, (e, result) => {
  if (e) {
    // handle new error
  } else {
    // handle new result set
  }
});
export default {
  name: "App",
  components: {
    Chart,
    QueryBuilder
  },
  data() {
    return {
      cubejsApi,
      totalLapdataQuery: { measures: ["PacketLapData.count"] },
      totalLapdataPacketsQuery: { measures: ["PacketLapData.packetCount"] },
      // lineQuery: {
      //   measures: ["PacketLapDataLapdata.count"],
      //   timeDimensions: [
      //     {
      //       dimension: "Users.createdAt",
      //       dateRange: ["2019-01-01", "2020-12-31"],
      //       granularity: "month"
      //     }
      //   ]
      // },
      // barQuery: {
      //   measures: ["Orders.count"],
      //   dimensions: ["Orders.status"],
      //   timeDimensions: [
      //     {
      //       dimension: "Orders.createdAt",
      //       dateRange: ["2019-01-01", "2020-12-31"],
      //       granularity: "month"
      //     }
      //   ]
      // }
    };
  }
};
</script>

<style>
html {
  -webkit-font-smoothing: antialiased;
}

body {
  padding-top: 30px;
  padding-bottom: 30px;
  background: #f5f6f7;
}
</style>
