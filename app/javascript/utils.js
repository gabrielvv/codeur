const isWithinNextXDays = (date, x) => {
    const now = new Date(Date.now());
    now.setHours(0);
    now.setMinutes(0);
    now.setSeconds(0);
    now.setMilliseconds(0);
    const diff = (new Date(date)).getTime() - now;
    return diff > 0 && diff < x * 24 * 60 * 60 * 1000
}

export {
    isWithinNextXDays,
}