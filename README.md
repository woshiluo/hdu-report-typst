# HDU-Report-Typst

杭州电子科技大学的报告模板

> **注意**
> 
> 本仓库**并非官方模板。**
> 
> 修改自 <https://github.com/zjutjh/zjut-report-typst>。

WIP

### 文件说明

- [`template/template.typ`](./template/template.typ) 模板入口
- [`example.typ`](./example.typ) 样例文件
- `example.pdf` 编译出的 PDF 文件

## 如何使用

### Linux/Mac

执行 [`get-template.sh`](./get-template.sh)：

```bash
sh -c "$(wget https://raw.githubusercontent.com/woshiluo/hdu-report-typst/refs/heads/master/get-template.sh -O -)"
```

### 手动

Clone 本仓库后手动导入。

### 关于 Package

参考 <https://github.com/typst/packages#local-packages>。

Template 不应该是一个 Package, 而关于 Template 的基础建设正在进行中，请参考 <https://github.com/typst/typst/issues/2432>。因此如果有需求将本模板作为一个 package，请按照自己的系统自行将 `template` 目录中的内容放置到对应位置。

例如在 Linux 环境中可以使用以下路径：

`~/.local/share/typst/packages/local/hdu-report-typst/0.1.0/template.typ`

复制完毕后即可使用如下方式导入：

```typ
#import "@local/hdu-report-typst:0.1.0": *
```

> 需要注意这是一个暂时性的解决方案，之后理论上会依赖于 Typst CLI。

## 关于 Typst

Typst 是一个新的基于 Markup 的排版引擎，类似于 $\LaTeX$。由于 Typst 还处于开发阶段，本模板可能随时出现问题。

可以参考 Typst 的官方文档：<https://typst.app/docs>

## 参考

- [zjut-report-tex](https://github.com/zjutjh/zjut-report-tex)
- [HUST-typst-template](https://github.com/werifu/HUST-typst-template)
- [i-figured](https://github.com/typst/packages/tree/main/packages/preview/i-figured/0.1.0)
