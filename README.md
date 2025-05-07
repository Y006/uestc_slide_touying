# uestc_slide_touying
### 介绍
这是一个电子科技大学的 Touying 模版，适用于快速构建组会汇报 slide。
### 模版展示
[效果预览](https://y006.github.io/uestc_slide_touying/main.pdf)
### 文件说明
```txt
uestc_slide_touying/
├── main.typ               # 主幻灯片文件（建议以此为起点撰写汇报）
├── ref.bib                # BibTeX 格式的参考文献库
├── main.pdf               # 编译生成的输出 PDF 文件
│
├── themes/                # UESTC 专属主题配置目录
│   └── uestc.typ          # 定义电子科技大学风格的主题文件
│
├── example/               # 示例幻灯片内容
│   └── example.typ        # 示例 Typst 源码
│   └── example.pdf        # 示例输出 PDF，用于参考展示效果
│
├── pictures/              # 静态图像资源目录（如 logo、背景图等）
│   ├── uestc-logo.svg     # UESTC 校徽（SVG 格式）
│   ├── uestc-name.svg     # UESTC 名称文字标识
│   └── ...                # 其他图像资源
│
├── docs/                  # 用于 GitHub Pages 的网页展示文件
│   └── main.pdf           # 网页预览用 PDF（保持兼容主链接）
│   └── example.pdf        # 示例 PDF 网页预览版本
│
├── folder-alias.json      # Typst 插件 alias 的辅助配置（本地使用，未上传）
└── README.md              # 项目说明文档（当前即为此文件）
```

### 快速开始

#### 安装 Typst

可以通过不同的软件包管理器安装Typst。请注意，软件包管理器中的版本可能落后于最新发布版。
- Linux:
  - View [Typst on Repology](https://repology.org/project/typst/versions)
  - View [Typst's Snap](https://snapcraft.io/typst)
- macOS: `brew install typst`
- Windows: `winget install --id Typst.Typst`

#### 克隆仓库

使用以下命令将本项目克隆到本地：

```
git clone https://github.com/Y006/uestc_slide_touying.git
cd uestc_slide_touying
```

#### 编写幻灯片

你可以直接在 main.typ 中编写幻灯片内容。默认已引入主题与结构框架，可直接开始撰写。

如需参考写法，可查看 example/example.typ 中的实例内容。

更详细的教程：TODO

#### 编译生成 PDF

确保你已安装 Typst，随后在项目根目录运行：

```
typst compile main.typ
```

生成的 PDF 文件将保存为 main.pdf，可直接打开查看或上传分享。

### 支持与贡献

如你在使用过程中发现问题，欢迎通过 [GitHub Issue](https://github.com/Y006/uestc_slide_touying/issues) 提出反馈。你也可以通过 Pull Request 方式提交改进建议或新增内容。
