
test('cloneDashboard', () => {
  const cloneDashboardSaga = cloneDashboard();
  const takeEffect = cloneDashboardSaga.next();
  expect(takeEffect.value.type).toEqual("TAKE");
  expect(takeEffect.value.payload.pattern).toContain("CLONE_DASHBOARD");

  const id = {
    id: "2"
  };
  const callEffect = cloneDashboardSaga.next(id).value;

  expect(callEffect.type).toEqual("CALL");
  expect(callEffect).toEqual(call(API.cloneDashboard,'2'));

  const putEffect = cloneDashboardSaga.next("2");
  
  expect(putEffect.value.type).toEqual("PUT");
});


test('loadDashboard', () => {
  const loadDashboardSaga = loadDashboard();
  const takeEffect = loadDashboardSaga.next();
  expect(takeEffect.value.type).toEqual("TAKE");
  expect(takeEffect.value.payload.pattern).toContain("LOAD_DASHBOARD");

  const basicW = {
    id: "1",
    name: "",
    user: "",
    insertTime: "",
    updateTime: "",
    group: "",
    groupWriteAccess: "",
    lastUpdatedBy: "",
    widgets: {}
  };

  const callEffect = loadDashboardSaga.next(basicW).value;

  expect(callEffect.type).toEqual("CALL");
  expect(callEffect).toEqual(call(API.load,'1'));

  const dashboard = {
    id: "1",
    name: "",
    user: "",
    insertTime: "",
    updateTime: "",
    group: "",
    groupWriteAccess: "",
    lastUpdatedBy: "",
  };
  const widgets = [];

  const putEffect = loadDashboardSaga.next(dashboard,widgets);
  
  expect(putEffect.value.type).toEqual("PUT");
});

test('exportDashboard', () => {
  const exportDashboardSaga = exportDashboard();
  const takeEffect = exportDashboardSaga.next();
  expect(takeEffect.value.type).toEqual("TAKE");
  expect(takeEffect.value.payload.pattern).toEqual("EXPORT_DASHBOARD");

  const basicW = {
    id: "1",
    name: "",
    user: "",
    insertTime: "",
    updateTime: "",
    group: "",
    groupWriteAccess: "",
    lastUpdatedBy: "",
    widgets: {}
  };

  const callEffect = exportDashboardSaga.next(basicW).value;

  expect(callEffect.type).toEqual("CALL");
  expect(callEffect).toEqual(call(API.exportDash,'1'));

  const dashboard = {
    id: "1",
    name: "",
    user: "",
    insertTime: "",
    updateTime: "",
    group: "",
    groupWriteAccess: "",
    lastUpdatedBy: "",
  };
  const widgets = [];

  const putEffect = exportDashboardSaga.next(dashboard,widgets);

  expect(putEffect.value.type).toEqual("PUT");
});
