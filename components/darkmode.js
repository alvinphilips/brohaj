import { Switch } from '@headlessui/react'
import { SunIcon } from '@heroicons/react/24/solid'
import { MoonIcon } from '@heroicons/react/24/solid'

export default function DarkModeToggle({darkMode, setDarkMode}) {
    return (
    <>
        <div className="flex flex-row items-center gap-1">
        <SunIcon className='w-4 h-4' />
        <Switch checked={darkMode} onChange={setDarkMode} defaultChecked={false} className={`bg-slate-50 dark:bg-slate-900 relative inline-flex h-6 w-11 items-center rounded-full`}>
            <span className="sr-only">Enable dark mode</span>
            <span className={`${darkMode ? "translate-x-6" : "translate-x-1"} inline-block h-4 w-4 transform rounded-full bg-slate-300 dark:bg-slate-700 transistion`}></span>
        </Switch>
        <MoonIcon className='w-4 h-4' />
        </div>
    </>
    )
}

  