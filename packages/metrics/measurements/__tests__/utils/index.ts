
import { getConnections as getC } from '@launchql/db-testing';

export const getConnections = async () => {
  return getC(['myschema', 'myschema_public'], { plan: 'launchql.plan' });
};
