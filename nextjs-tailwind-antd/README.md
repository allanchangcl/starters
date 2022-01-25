### setup antd

yarn add antd

// in globals.css add ...
@import '~antd/dist/antd.css';

```
import React, { FC } from 'react';
import { Button } from 'antd';
import './App.css';

const App: FC = () => (
  <div className="App">
    <Button type="primary">Button</Button>
  </div>
);

export default App;
```

### modify antd

https://github.com/SolidZORO/next-plugin-antd-less
