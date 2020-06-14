with open('/home/marco/.vim/UltiSnips/resumen', 'w') as res:
    with open('/home/marco/.vim/UltiSnips/tex.snippets') as file:
        for line in file:
            if 'snippet' in line and 'endsnippet' not in line:
                try:
                    d = line.split()
                    res.write(f'{d[1]} -> {d[2]}\n')
                except IndexError:
                    pass
