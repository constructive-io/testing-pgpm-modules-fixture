import { getConnections as getConn } from 'pgsql-test';

export const getConnections = async () => {
  return getConn();
};
