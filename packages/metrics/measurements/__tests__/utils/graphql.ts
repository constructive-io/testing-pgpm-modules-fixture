
import { getConnections as getC, getConnectionsApi as getA } from '@launchql/graphql-testing';

export const getService = (schemas: string[]) => ({ dbname }: { dbname: string }) => ({
  settings: {
    dbname,
    schemas,
    svc: {
      domain: 'localhost',
      subdomain: 'api',
      dbname,
      role_name: 'authenticated',
      anon_role: 'anonymous',
      schemas
    }
  }
});

export const getConnections = async (schemas: string[]) => {
  return getC(schemas, getService(schemas), { plan: 'launchql.plan' });
};

export const getConnectionsApi = async ([pub, priv]: [string, string]) => {
  return getA([pub, priv], getService([pub]), { plan: 'launchql.plan' });
};
