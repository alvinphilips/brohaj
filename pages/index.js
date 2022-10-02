import Head from 'next/head'
import { useState } from 'react'
import DarkModeToggle from '../components/darkmode.js'

export default function Home() {
  let [darkMode, setDarkMode] = useState(true);
  return (
    <div className={darkMode ? "dark": ""}>
      <Head>
        <title>Blohaj</title>
        <meta name="description" content="Help BLAHAJ get his fin back :)" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <div className="flex bg-slate-200 dark:bg-slate-800 text-slate-800 dark:text-slate-100 w-full h-12">
        <DarkModeToggle darkMode={darkMode} setDarkMode={setDarkMode} className="bg-blue-400"/>
      </div>     
    </div>
  )
}

