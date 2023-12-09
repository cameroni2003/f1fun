import React from "react";
import DataTable, { type TableColumn } from "react-data-table-component";

interface DataRow {
  driverName: string;
}
export function ListTable(input: any) {
  const columns: TableColumn<DataRow>[] = [
    { name: "Driver Name", selector: (row) => row.driverName },
  ];
  const data = input;
  console.log(input);
  return <DataTable columns={columns} data={input} />;
}
