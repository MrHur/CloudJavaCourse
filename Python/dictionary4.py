a = {'name': 'pey', 'phone': '010-9999-1234', 'birth': '1118'}
a.get('name')
a.get('phone')

a = {'name': 'pey', 'phone': '010-9999-1234', 'birth': '1118'}
print(a.get('nokey'))
print(a['nokey'])

a.get('nokey', 'foo')
